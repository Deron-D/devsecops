import os
import json
import datetime
import socket
import base64
import string
import random
import psycopg2
from pathlib import Path

from flask import Flask
from flask import request, jsonify, render_template, url_for

from flask_bootstrap import Bootstrap5

def create_app():
  app = Flask(__name__)
  bootstrap = Bootstrap5(app)

  def get_cursor():
    conn = psycopg2.connect(host="postgres",
      database="owasp10",
      user="owasp10",
      password="LTAIsupersecretkeyfordat")
    

    conn.set_session(autocommit=True)

    return conn.cursor()

  @app.route("/")
  def root():
    return render_template('index.html')

  # The code below lets the Flask server respond to browser requests for a favicon
  @app.route("/favicon.ico")
  def favicon():
    return url_for('static', filename='favicon.ico')

  @app.route("/api/search/", methods=["POST"])
  def api_search():
    content = request.json
    rows = []
    if 'host' in content:
      host = content['host']
      if not host:
        host = '8.8.8.8'
      app.logger.debug(f"host: {host}")
      cur = get_cursor()
      try:
        query = f"SELECT h.host_ip, h.scan_date, r.risk_name, r.risk_descr FROM risks r INNER JOIN hosts h ON r.risk_id = h.risk_id  WHERE h.host_ip = '{host}';"
        app.logger.debug(f"query: {query}")
        cur.execute(query)
        rows = cur.fetchall()
        app.logger.debug(f"rows: {rows}")
      except:
        return jsonify({ "result": "Database error" }), 500


    return jsonify({ "result": rows })


  @app.route("/health/")
  def status():
    return jsonify({ "status": "ok", "database": get_cursor().connection.status })

  return app
