import pandas as pd
from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String, DateTime

# Create a SQLAlchemy engine for IRIS
engine = create_engine('iris+emb:///')
# Create a SQLAlchemy metadata object
metadata = MetaData()

# create table for csv data
people = Table('people', metadata,
    Column('id', Integer(), primary_key=True),
    Column('name', String(255), nullable=False),
    Column('age', Integer()),
)

# create table in IRIS
metadata.create_all(engine)

# read csv file
df = pd.read_csv('/home/irisowner/dev/data/people.csv')

# insert data into IRIS
df.to_sql('people', engine, if_exists='replace', index=False)

