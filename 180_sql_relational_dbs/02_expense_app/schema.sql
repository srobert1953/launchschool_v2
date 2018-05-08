CREATE TABLE expenses (
  id serial PRIMARY KEY,
  amount decimal(6,2) NOT NULL,
  memo text NOT NULL,
  created_on date NOT NULL DEFAULT NOW(),
  CHECK (amount >= 0.0)
);