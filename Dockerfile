FROM  python:3.9-slim
ENV WORKDIR=/app
WORKDIR ${WORKDIR}

COPY ./babyshop_app ${WORKDIR} 
RUN pip install --upgrade pip && pip install -r requirements.txt

EXPOSE 8025
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8025"]



# docker run  -p 8025:8025 babyshop-app:v1.0.0   
# add -d for detached mode with no teminal and logs 
# http://localhost:8025/
