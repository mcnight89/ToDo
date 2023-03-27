FROM python:3.10.7-slim


WORKDIR ToDo

COPY requirements.txt .

RUN python3 -m pip install --no cache -r requirements.txt

COPY . .

COPY migrations migrations


EXPOSE 8000


#RUN poetry config virtualenvs.create false \
   # && poetry install --no-dev --no-interaction --no-ansi --no-root

COPY . .

ENTRYPOINT ["bash", "entrypoint.sh"]

CMD ["gunicorn", "ToDO.wsgi", "-w", "4", "-b", "0.0.0.0:8000"]

