from random import randint
from flask import Flask
from flask_mail import Mail, Message
# import firebase_admin
# from firebase_admin import credentials
# from firebase_admin import firestore

# cred = credentials.Certificate('key.json')
# firebase_admin.initialize_app(cred)

# db = firestore.client()

email = "virtualbuild01@gmail.com"
password = "srxdgydasyklzhjd"
app = Flask(__name__)

app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = email
app.config['MAIL_PASSWORD'] = password
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
mail = Mail(app)


@app.route('/generate_otp/<user_email>')
def generate_otp(user_email):
    otp = randint(10000, 99999)
    msg = Message("Time to Unlock Your Dream Home!", sender=email, recipients=[user_email])
    msg.body = f"""Hi there, 

We hope you're doing well! 

We are sending you this email to provide you with your one-time password (OTP) to access our virtual building platform. This OTP will enable you to explore our wide range of houses and plans available for you to choose from. 

We are confident that you will find the perfect house and plans for your needs. Please enter the following OTP when prompted: {otp}

Thank you for choosing VirtualBuild! 

Best, 
VirtualBuild Team"""
    mail.send(msg)
    return str(otp)

@app.route('/resend_otp')
def resend_otp():
    pass

# @app.route('/verify_otp')
# def verify_otp():
#     pass

if __name__ == '__main__':
    app.run(debug=True)