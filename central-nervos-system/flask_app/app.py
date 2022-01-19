from flask import Flask, redirect, render_template
import flask
import flask_login
from flask_sqlalchemy import SQLAlchemy
from flask_bootstrap import Bootstrap
from werkzeug.security import generate_password_hash, check_password_hash

app = Flask(__name__)
app.config['SECRET_KEY'] = "Sabi. Beautifully simple."
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///db.sqlite' # TODO investigate splitting the databases from customer db, project db, etc.
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

login_manager = flask_login.LoginManager()
login_manager.login_view = 'login'
login_manager.init_app(app)

Bootstrap(app)

db.init_app(app)

class User(flask_login.UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True) # primary keys are required by SQLAlchemy
    username = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(100))

@login_manager.user_loader
def load_user(user_id):
    # since the user_id is just the primary key of our user table, use it in the query for the user
    return User.query.get(int(user_id))

@app.route('/login', methods=['GET', 'POST'])
def login():
    message = ''

    if flask.request.method == 'GET':
        return render_template('login.html',
                               message=message,
                               user_authenticated=flask_login.current_user.is_authenticated)

    if flask.request.method == 'POST':
        email = flask.request.form['email']
        password = flask.request.form['password']

        user = User.query.filter_by(email=email).first()

        if user and check_password_hash(user.password, password):
            flask_login.login_user(user)
            session['username'] = user.username
            return redirect('/')

        return render_template('login.html',
                               message='Account not found or password incorrect',
                               user_authenticated=flask_login.current_user.is_authenticated)

@app.route('/logout')
@flask_login.login_required
def logout():
    flask_login.logout_user()
    return redirect('/login')


@app.route('/')
@flask_login.login_required
def index():
    return render_template('index.html')

if __name__ == '__main__':
    db.create_all()
    app.run(host='0.0.0.0', port='1340')

