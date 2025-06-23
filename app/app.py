from flask import Flask, Response
from prometheus_client import Counter, generate_latest, REGISTRY, Histogram

app = Flask(__name__)

REQUEST_COUNT = Counter('app_request_count', 'Total HTTP Requests', ['method', 'endpoint'])
REQUEST_LATENCY = Histogram('app_request_latency_seconds', 'Request latency', ['endpoint'])

@app.route('/')
def index():
    with REQUEST_LATENCY.labels(endpoint='/').time():
        REQUEST_COUNT.labels(method='GET', endpoint='/').inc()
        return "Hello, Flask with Prometheus!"

@app.route('/metrics')
def metrics():
    return Response(generate_latest(REGISTRY), mimetype='text/plain')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5555)