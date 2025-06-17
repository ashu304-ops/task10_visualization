# Monitoring Stack with Ansible + Docker (No Kubernetes!)

A simple and practical setup to deploy **Prometheus**, **Node Exporter**, and **Grafana** in **Docker containers**, using **Ansible** for automation. No pre-built DockerHub images — we manually build everything from source for full transparency and control.

---

## Goal

Use **Ansible** to:

* Build Docker images for Prometheus, Node Exporter, and Grafana from source
* Run all services as containers
* Monitor your system with Grafana dashboards

---

##  Prerequisites

* Docker installed
* Ansible installed (`sudo apt install ansible` or `brew install ansible`)
* Basic knowledge of the Linux terminal

---

##  Project Structure

```
monitoring-lab/
├── docker/
│   ├── grafana/
│   │   └── Dockerfile
│   ├── node_exporter/
│   │   └── Dockerfile
│   └── prometheus/
│       ├── Dockerfile
│       └── prometheus.yml
├── ansible/
│   ├── site.yml
│   └── hosts.ini
```

---

##  Dockerfiles Overview

###  Prometheus (`docker/prometheus/Dockerfile`)

* Installs Prometheus v2.51.1 from source
* Uses `prometheus.yml` for configuration
* Exposes port `9090`

### Node Exporter (`docker/node_exporter/Dockerfile`)

* Installs Node Exporter v1.8.1 from source
* Exposes port `9100`

###  Grafana (`docker/grafana/Dockerfile`)

* Installs Grafana via official APT repository
* Exposes port `3000`

---

## Ansible Playbook

Located in `ansible/site.yml`, the playbook:

* Builds Docker images for all three components
* Launches them as containers
* Maps necessary ports
* Ensures containers restart automatically

---

##  Getting Started

1. Clone this repo:

   ```bash
   git clone https://github.com/ashu304-ops/task10_visualization.git
   cd monitoring-lab/ansible
   ```

2. Run the Ansible playbook:

   ```bash
   ansible-playbook -i hosts.ini site.yml
   ```

---

## 🔍 Access the Services

| Service       | URL                                                            | Default Login |
| ------------- | -------------------------------------------------------------- | ------------- |
| Grafana       | [http://localhost:3000](http://localhost:3000)                 | admin / admin |
| Prometheus    | [http://localhost:9090](http://localhost:9090)                 | —             |
| Node Exporter | [http://localhost:9100/metrics](http://localhost:9101/metrics) | —             |

---

## Set Up Grafana Dashboard

1. Go to [http://localhost:3000](http://localhost:3000)
2. Log in (`admin / admin`)
3. Go to **Settings → Data Sources → Add data source**
4. Choose **Prometheus**
5. Set URL to: `http://host.docker.internal:9090`
6. Save and explore your metrics
7. Better dashboard follow this steps
--------------------
 Open Grafana in your browser:
http://localhost:3000 (or your server IP)

Go to:
Dashboards → Import

Choose one of the following:

Use ID 1860 for a great prebuilt Node Exporter dashboard

Select your Prometheus data source

Click Import

----------------------

##  Notes

* This setup is designed for **local testing/development**
* All binaries are manually downloaded from official GitHub releases
* Make sure Docker daemon is running before executing the playbook

---



