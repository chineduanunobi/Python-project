from flask import Flask, render_template, request, jsonify, abort

app = Flask(__name__)

@app.route('/', methods=['GET', 'POST'])
def index():
    user_name = None
    user_ip = None

    if request.method == 'POST':
        user_name = request.form['name']
        user_ip = request.remote_addr

    return render_template('hello.html', user_name=user_name, user_ip=user_ip)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
