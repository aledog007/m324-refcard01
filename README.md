
# App Ref. Card 01
Standalone Spring Boot Application

---
title: App Ref. Card 01
author: Rinaldo Lanza, BBW
date: 12. Februar 2023
---


Link zur Übersicht:<br/>
https://gitlab.com/bbwrl/m347-ref-card-overview


## Installation der benötigten Werkzeuge

Maven Tutorial for Beginners<br/>
https://www.simplilearn.com/tutorials/maven-tutorial



### Projekt bauen und starten
Die Ausführung der Befehle erfolgt im Projektordner
Builden mit Maven<br/>
```$ mvn package```

Das Projekt wird gebaut und die entsprechende Jar-Datei im Ordner Target erstellt (Artefakt).
Die erstellte Datei kann nun direkt mit Java gestartet werden.<br/>
```$ java -jar target/app-refcard-01-0.0.1-SNAPSHOT.jar```

Die App kann im Browser unter der URL http://localhost:8080 betrachtet werden.


### Inbetriebnahme mit Docker Container
Image bauen (die Maven Tests laufen beim Build mit):<br/>
```$ docker build -t m324refcard01 .```

Container starten:<br/>
```$ docker run -d -p 8080:8080 --name refcard01 m324refcard01```

Oder direkt das fertige Image von Docker Hub nehmen:<br/>
```$ docker run -d -p 8080:8080 aledog007/m324refcard01:latest```

### CI/CD mit GitHub Actions
Bei jedem Push auf main baut der Workflow `.github/workflows/docker-publish.yml` das Image, startet einen Testcontainer
und prüft die Seite und die API mit curl. Wenn alles ok ist, wird das Image mit den Tags `latest` und dem Commit-SHA
auf Docker Hub gepusht. Dafür braucht es im Repo die Secrets `DOCKERHUB_USERNAME` und `DOCKERHUB_TOKEN`.
