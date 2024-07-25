FROM node:20.13.0-alpine

RUN npm install -g @mockoon/cli@8.1.1
COPY mockoon-api.json ./mockoon-api.json

# Do not run as root.
RUN adduser --shell /bin/sh --disabled-password --gecos "" mockoon
RUN chown -R mockoon ./mockoon-api.json
USER mockoon

EXPOSE 3002

ENTRYPOINT ["mockoon-cli", "start", "--hostname", "0.0.0.0", "--data", "mockoon-api.json"]