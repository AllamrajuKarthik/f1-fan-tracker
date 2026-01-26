import mysql.connector
from flask import Flask, render_template, request, redirect, session
from werkzeug.security import generate_password_hash, check_password_hash


app = Flask(__name__)
app.secret_key = "dev-secret-key-change-this-later"

# Database configuration
DB_CONFIG = {
    "host": "db",
    "user": "f1user",
    "password": "f1password",
    "database": "f1_fan_tracker"
}

def get_db_connection():
    return mysql.connector.connect(**DB_CONFIG)

# Routes

@app.route("/")
def home():
    if "user_id" in session:
        return redirect("/dashboard")
    return redirect("/drivers")

@app.route("/drivers")
def drivers():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT d.id, d.name, t.name AS team
        FROM drivers d
        JOIN teams t ON d.team_id = t.id
        ORDER BY d.name;
    """)

    drivers = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("drivers.html", drivers=drivers)

@app.route("/drivers/<int:driver_id>")
def driver_profile(driver_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT d.name, t.name AS team
        FROM drivers d
        JOIN teams t ON d.team_id = t.id
        WHERE d.id = %s;
    """, (driver_id,))
    driver = cursor.fetchone()

    cursor.execute("""
        SELECT s.year, dsp.points
        FROM driver_season_points dsp
        JOIN seasons s ON dsp.season_id = s.id
        WHERE dsp.driver_id = %s
        ORDER BY s.year;
    """, (driver_id,))
    points = cursor.fetchall()

    cursor.close()
    conn.close()

    if not driver:
        return "Driver not found", 404

    return render_template(
        "driver_profile.html",
        driver=driver,
        points=points,
        driver_id=driver_id
    )
    
@app.route("/teams")
def teams():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT id, name
        FROM teams
        ORDER BY name;
    """)

    teams = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template("teams.html", teams=teams)

@app.route("/teams/<int:team_id>")
def team_profile(team_id):
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT id, name, team_principal
        FROM teams
        WHERE id = %s;
    """, (team_id,))
    team = cursor.fetchone()

    cursor.execute("""
        SELECT s.year, tsp.points
        FROM team_season_points tsp
        JOIN seasons s ON tsp.season_id = s.id
        WHERE tsp.team_id = %s
        ORDER BY s.year;
    """, (team_id,))
    points = cursor.fetchall()

    cursor.close()
    conn.close()

    if not team:
        return "Team not found", 404

    image_name = team["name"].lower().replace(" ", "_")


    return render_template(
        "team_profile.html",
        team=team,
        points=points,
        team_id=team_id,
        image_name=image_name
    )

@app.route("/register", methods=["GET", "POST"])
def register():
    if request.method == "POST":
        username = request.form["username"]
        email = request.form["email"]
        password = request.form["password"]

        password_hash = generate_password_hash(password)

        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("""
            INSERT INTO users (username, email, password_hash)
            VALUES (%s, %s, %s)
        """, (username, email, password_hash))

        conn.commit()
        cursor.close()
        conn.close()

        return redirect("/login")

    return render_template("register.html")

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        conn = get_db_connection()
        cursor = conn.cursor(dictionary=True)

        cursor.execute(
            "SELECT * FROM users WHERE username = %s",
            (username,)
        )
        user = cursor.fetchone()

        cursor.close()
        conn.close()

        if user and check_password_hash(user["password_hash"], password):
            session["user_id"] = user["id"]
            session["username"] = user["username"]
            return redirect("/dashboard")

        return "Invalid username or password", 401

    return render_template("login.html")


@app.route("/dashboard")
def dashboard():
    if "user_id" not in session:
        return redirect("/login")

    user_id = session["user_id"]

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("""
        SELECT f.item_type, d.name AS driver_name, t.name AS team_name
        FROM favorites f
        LEFT JOIN drivers d ON f.item_type = 'driver' AND f.item_id = d.id
        LEFT JOIN teams t ON f.item_type = 'team' AND f.item_id = t.id
        WHERE f.user_id = %s
    """, (user_id,))

    favorites = cursor.fetchall()

    cursor.close()
    conn.close()

    return render_template(
        "dashboard.html",
        favorites=favorites,
        username=session["username"]
    )

@app.route("/logout")
def logout():
    session.clear()
    return redirect("/login")

@app.route("/favorite/driver/<int:driver_id>")
def favorite_driver(driver_id):
    if "user_id" not in session:
        return redirect("/login")

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("""
        INSERT IGNORE INTO favorites (user_id, item_type, item_id)
        VALUES (%s, 'driver', %s)
    """, (session["user_id"], driver_id))

    conn.commit()
    cursor.close()
    conn.close()

    return redirect(f"/drivers/{driver_id}")

@app.route("/favorite/team/<int:team_id>")
def favorite_team(team_id):
    if "user_id" not in session:
        return redirect("/login")

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("""
        INSERT IGNORE INTO favorites (user_id, item_type, item_id)
        VALUES (%s, 'team', %s)
    """, (session["user_id"], team_id))

    conn.commit()
    cursor.close()
    conn.close()

    return redirect(f"/teams/{team_id}")


# Entry point for the app
if __name__ == "__main__":
    app.run(debug=True)
