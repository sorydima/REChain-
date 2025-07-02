
from flask import Flask, render_template
import subprocess

app = Flask(__name__)

@app.route("/")
def dashboard():
    synapse_status = subprocess.getoutput("docker ps | grep synapse")
    bridges = subprocess.getoutput("docker ps | grep bridge")
    return render_template("index.html", synapse_status="🟢 OK" if "synapse" in synapse_status else "🔴 DOWN", bridges=bridges)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
