import sqlite3
import rsa
from multiprocessing import Process, cpu_count
def make_db_key(pub_key_file: str, priv_key_file: str):
    (pubkey, privkey) = rsa.newkeys(8192, poolsize=max(cpu_count() - 1, 1))
    for key, path in [(pubkey, pub_key_file), (privkey, priv_key_file)]:
        key_bytes = key.save_pkcs1()
        file = open(path, 'wb')
        file.write(key_bytes)
        file.close()
if __name__ == '__main__':
    # Create DB Keys
    pub_key_file, priv_key_file = 'db_public.txt', 'db_private.txt'
    key_process = Process(target=make_db_key, args=(pub_key_file, priv_key_file))
    key_process.start()

    # Create Tables
    con = sqlite3.connect("database.db")
    cursor = con.cursor()

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS organizations (
            id text PRIMARY KEY,
            name text NOT NULL
        )
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS accounts (
    username text PRIMARY KEY,
    password text NOT NULL,
    account_type text NOT NULL
    )
    """)

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS campaigns (
        id text PRIMARY KEY,
        organizer_username text NOT NULL,
        organization_name text,
        description text,
        start_time text NOT NULL,
        end_time text NOT NULL
        )
    """)

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS positions (
        id text PRIMARY KEY,
        campaign_id text NOT NULL,
        campaign_order text NOT NULL,
        name text NOT NULL,
        FOREIGN KEY (campaign_id) REFERENCES campaigns (id)
        )
        """)

    cursor.execute("""
        CREATE TABLE IF NOT EXISTS candidates (
        id text PRIMARY KEY,
        position_id text NOT NULL,
        position_order text NOT NULL,
        name text NOT NULL,
        FOREIGN KEY (position_id) REFERENCES positions (id)
        )
        """)
    # votes represents ballots that have already been cast
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS votes (
        id text PRIMARY KEY,
        candidate_id text NOT NULL,
        voter_id text NOT NULL,
        time text NOT NULL,
        FOREIGN KEY (candidate_id) REFERENCES candidates,
        FOREIGN KEY (voter_id) REFERENCES accounts
        )
        """)
    # Ballots represent positions that a voter can vote on
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS ballots (
        position_id text,
        voter_id text ,
        FOREIGN KEY (position_id) REFERENCES positions,
        FOREIGN KEY (voter_id) REFERENCES accounts,
        PRIMARY KEY (position_id, voter_id)
        )
        """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS memberships (
        username text NOT NULL,
        organization_id text NOT NULL,
        FOREIGN KEY (username) REFERENCES accounts (username),
        FOREIGN KEY (organization_id) REFERENCES organizations (id),
        PRIMARY KEY (username, organization_id)
        )
    """)

    cursor.close()
    con.commit()
    con.close()
    key_process.join()

