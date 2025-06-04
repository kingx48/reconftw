from flask import Flask, render_template, request, redirect, url_for, flash
import subprocess
import os

# Mapping of preset names to additional arguments for websn1per
PRESETS = {
    "recon": ["--recon"],
    "passive": ["--passive"],
    "web": ["--web"],
    "all": ["--all"],
    "oswe": ["--recon", "-m", "oswe"],
    "ewptx": ["--recon", "-m", "ewptx"],
}

app = Flask(__name__)
app.secret_key = 'websn1per'

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        domain = request.form.get('domain')
        rate = request.form.get('rate')
        preset = request.form.get('preset')
        mode = request.form.get('mode')
        if not domain:
            flash('Domain is required', 'error')
            return redirect(url_for('index'))
        cmd = ['./websn1per.sh', '-d', domain]
        if rate:
            cmd += ['-r', rate]
        if preset in PRESETS:
            cmd += PRESETS[preset]
        if mode and preset not in ['oswe', 'ewptx']:
            cmd += ['-m', mode]
        try:
            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, text=True)
        except subprocess.CalledProcessError as e:
            output = e.output
        return render_template('index.html', output=output)
    return render_template('index.html', output=None)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000)
