import sqlite3
import rsa
from threading import Lock
from uuid import uuid4

class Controller(object):
    def __init__(self, db_path, pub_key_path, priv_key_path):
        keys = []
        for path, key_type in [(pub_key_path, rsa.PublicKey.load_pkcs1), (priv_key_path, rsa.PrivateKey.load_pkcs1)]:
            with open(path, 'rb') as file:
                keys.append(key_type(file.read()))
        self.pub_key, self.priv_key = keys
        self.db_path = db_path
        self.db_lock = Lock()

    def acquire_connection(self):
        self.db_lock.acquire()
        con = sqlite3.connect(self.db_path)
        con.create_function('encrypt', 1, self.encrypt)
        con.create_function('decrypt', 1, self.decrypt)
        return con, con.cursor()

    def release_connection(self, connection: sqlite3.Connection, cursor: sqlite3.Cursor):
        cursor.close()
        connection.commit()
        connection.close()
        self.db_lock.release()

    def encrypt(self, string: str):
        return rsa.encrypt(string.encode('utf8'), self.pub_key)

    def decrypt(self, bytes):
        return rsa.decrypt(bytes, self.priv_key).decode('utf8')

    def check_username_password_match(self):
        pass

    def username_available(self, name):
        con, cursor = self.acquire_connection()
        result = bool(list(cursor.execute(
            f"""SELECT EXISTS (SELECT 1 FROM accounts WHERE LOWER(decrypt(username))="{name.lower()}") """))[0][0])
        self.release_connection(con, cursor)
        return result
    def create_account(self, username, password, account_type):
        con, cursor = self.acquire_connection()
        cursor.execute(f"""
        INSERT INTO accounts (username, password, account_type)
        VALUES (encrypt({username}), encrypt({password}), encrypt({account_type}))
        """)
        self.release_connection(con, cursor)
    def create_campaign(self, campaign):
        """
        :param campaign:
        :return:
        """



if __name__ == '__main__':
    c = Controller('database.db', 'db_public.txt', 'db_private.txt')
    crypt = c.encrypt('this is a test')
    print(crypt)
    message = c.decrypt(crypt)
    print(message)
    test_user_available = c.username_available('test_user')
