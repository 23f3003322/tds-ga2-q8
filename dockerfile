FROM python:3.11-slim

# Create user UID 1000
RUN useradd -m -u 1000 user

WORKDIR /app

# Copy dependencies list
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy app source code
COPY --chown=user . .
USER user

EXPOSE 7118
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "7118"]
