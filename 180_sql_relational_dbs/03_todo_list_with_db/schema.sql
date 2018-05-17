CREATE TABLE lists (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);

CREATE TABLE todos (
  id serial PRIMARY KEY,
  list_id integer NOT NULL references lists(id),
  name text NOT NULL,
  completed BOOLEAN NOT NULL DEFAULT false
);
