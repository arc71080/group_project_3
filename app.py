import numpy as np

import sqlalchemy
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func

from flask import Flask, jsonify

#################################################
# Database Setup
#################################################
engine = create_engine("sqlite:///shooting.sqlite")

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(autoload_with=engine)


# Save reference to the table
passengers = Base.classes.passenger
#shootings = Base.classes.shootings


#################################################
# Flask Setup
#################################################
app = Flask(__name__)


#################################################
# Flask Routes
#################################################

@app.route("/")
def welcome():
    """List all available api routes."""
    return (
        f"Available Routes:<br/>"
        f"/api/v1.0/shootings<br/>"
        f"/api/v1.0/state population<br/>"
        f"/api/v1.0/county population"
    )


@app.route("/api/v1.0/shootings")
def names():
    # Create our session (link) from Python to the DB
    session = Session(engine)

    """Return a list of all passenger names"""
    # Query all shootings
    results = session.query(shooting.lat, shooting.long).all()

    session.close()

    # Create a dictionary from the row data and append to a list of all_passengers
    all_shootings = []
    for lat, long in results:
        shootings_dict = {}
        shootings_dict["name"] = lat
        shootings_dict["age"] = long
        all_shootings.append(shootings_dict)

    return jsonify(all_shootings)



if __name__ == '__main__':
    app.run(debug=True)

