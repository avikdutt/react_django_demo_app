FROM python:3.9 AS backend-builder
WORKDIR app
COPY . /app
RUN pip install --no-cache-dir -r requirements.txt
FROM python:3.9-slim-buster
WORKDIR /data
COPY --from=backend-builder /app /data
EXPOSE 8001
CMD ["python","manage.py","runserver","0.0.0.0:8001"]
