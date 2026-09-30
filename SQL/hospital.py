# Hospital Management System - Python + MySQL
# Uses the database you already created in the MySQL client.
# Install:  pip install mysql-connector-python

import mysql.connector as conn

# ---------- change these 3 lines ----------
USERNAME = "root"
PASSWORD = "P@81word"
DATABASE = "hospital_managment_system"      # the database name you used in MySQL client
# -------------------------------------------

# ---------- connect to MySQL ----------
try:
    con = conn.connect(host="localhost", user=USERNAME, password=PASSWORD, database=DATABASE)
    cur = con.cursor()
    print("Connected to database:", DATABASE)
except conn.Error as e:
    con = None
    print("Could not connect:", e)
    print("Tip: run  SHOW DATABASES;  in the MySQL client and copy the exact name into DATABASE above.")


def get_tables():
    cur.execute("SHOW TABLES")
    return [row[0] for row in cur.fetchall()]


def get_columns(t):
    """Read column names and primary key(s) straight from the database."""
    cur.execute(f"SHOW COLUMNS FROM `{t}`")
    rows = cur.fetchall()
    cols = [r[0] for r in rows]
    keys = [r[0] for r in rows if r[3] == "PRI"]
    if keys == []:
        keys = cols               # no primary key: match on every column
    return cols, keys


def show(query, values=()):
    cur.execute(query, values)
    rows = cur.fetchall()
    headings = [c[0] for c in cur.description]
    print()
    print(" | ".join(headings))
    print("-" * 60)
    for row in rows:
        print(" | ".join(str(x) for x in row))
    print(f"({len(rows)} rows)")


def ask_key(keys):
    return [input(f"Enter {k}: ") for k in keys]


# ---------- the operations ----------
def view(t):
    show(f"SELECT * FROM `{t}`")


def search(t):
    cols, keys = get_columns(t)
    col = input(f"Search in which column? {cols}: ")
    if col not in cols:
        print("No such column.")
        return
    word = input("Search for: ")
    show(f"SELECT * FROM `{t}` WHERE `{col}` LIKE %s", ("%" + word + "%",))


def insert(t):
    cols, keys = get_columns(t)
    values = []
    for c in cols:
        v = input(f"Enter {c} (dates as YYYY-MM-DD, blank = empty): ")
        values.append(v if v != "" else None)
    names = ", ".join(f"`{c}`" for c in cols)
    marks = ", ".join(["%s"] * len(cols))
    cur.execute(f"INSERT INTO `{t}` ({names}) VALUES ({marks})", values)
    con.commit()
    print("Record inserted.")


def update(t):
    cols, keys = get_columns(t)
    print("Which record do you want to modify?")
    key_values = ask_key(keys)
    where = " AND ".join(f"`{k}`=%s" for k in keys)
    cur.execute(f"SELECT * FROM `{t}` WHERE {where}", key_values)
    old = cur.fetchone()
    cur.fetchall()
    if old is None:
        print("Record not found.")
        return
    new = []
    for c, o in zip(cols, old):
        v = input(f"{c} [{o}] (Enter to keep): ")
        new.append(o if v == "" else v)
    sets = ", ".join(f"`{c}`=%s" for c in cols)
    cur.execute(f"UPDATE `{t}` SET {sets} WHERE {where}", new + key_values)
    con.commit()
    print("Record updated.")


def delete(t):
    cols, keys = get_columns(t)
    print("Which record do you want to delete?")
    key_values = ask_key(keys)
    if input("Are you sure? (y/n): ").lower() != "y":
        return
    where = " AND ".join(f"`{k}`=%s" for k in keys)
    cur.execute(f"DELETE FROM `{t}` WHERE {where}", key_values)
    con.commit()
    print(cur.rowcount, "record(s) deleted.")


# ---------- menus ----------
def table_menu(t):
    while True:
        print(f"\n--- {t} ---")
        print("1. View all   2. Search   3. Insert   4. Update   5. Delete   0. Back")
        choice = input("Choice: ")
        try:
            if choice == "1": view(t)
            elif choice == "2": search(t)
            elif choice == "3": insert(t)
            elif choice == "4": update(t)
            elif choice == "5": delete(t)
            elif choice == "0": break
            else: print("Invalid choice.")
        except conn.Error as e:
            con.rollback()
            print("Error:", e)


def main_menu():
    tables = get_tables()
    if tables == []:
        print("This database has no tables. Check the DATABASE name.")
        return
    while True:
        print("\n===== HOSPITAL MANAGEMENT SYSTEM =====")
        for i, n in enumerate(tables, 1):
            print(f"{i}. {n}")
        print("q. Run your own SELECT query")
        print("0. Exit")
        choice = input("Choice: ")
        if choice == "0":
            break
        elif choice.isdigit() and 1 <= int(choice) <= len(tables):
            table_menu(tables[int(choice) - 1])
        elif choice.lower() == "q":
            try:
                show(input("SELECT ... : "))
            except conn.Error as e:
                print("Error:", e)
        else:
            print("Invalid choice.")


if con is not None:
    main_menu()
    cur.close()
    con.close()
    print("Goodbye.")