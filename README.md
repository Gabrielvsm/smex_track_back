# SmexTrack :receipt:

Project to help keep financial track of supply, production and sales of micro businesses. 
The project is in early stage and ongoing development, new features and improvements are to be implemented.

This repo is for the API portion of the project.

## Division :label:

The records are currently divided into the following contexts and entities:

- Supply: context responsible for handling the records of supplies used.
  - Supply Batch: batches of supplies that hold information on each run of supply purchases
  - Item: information on the item bought and what supply batch it belongs
- Production: context that handles records of production
  - Production Batch: holds information on each batch of products produced
  - Production Item: record that links an Item from its Supply Batch to a Product
  - Product: information of the product produced on a Production Batch
- Sales: context that handles sales
  - Selling Record: saves the details of a sale

## Setup :wrench:

The project runs on SQLite3, so to be able to run it you must have it installed, or configure it to run
on your preferred database.

After that you should run:

```bash
# install the dependencies
mix deps.get

# create the database
mix ecto.create

# run the migrations
mix ecto.migrate
```

And then just run `mix phx.server` to run the server and use it.

