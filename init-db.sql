-- Create `vehicles` table
DROP TABLE IF EXISTS vehicles;
CREATE TABLE vehicles (
  vehicle_id SERIAL PRIMARY KEY,
  model_name VARCHAR(255),
  year INT
);

-- Create `user_data` table
DROP TABLE IF EXISTS user_data;
CREATE TABLE user_data (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255),
  vehicle_id INT,
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

-- Create `proposed_trades` table
DROP TABLE IF EXISTS proposed_trades;
CREATE TABLE proposed_trades (
  user_id INT NOT NULL,
  trade_vehicle_id INT NOT NULL,
  receive_vehicle_id INT NOT NULL,
  trade_id SERIAL PRIMARY KEY,
  trade_completed BOOLEAN DEFAULT FALSE
);

-- Create `acceptable_trades` table
DROP TABLE IF EXISTS acceptable_trades;
CREATE TABLE acceptable_trades (
  user_id INT NOT NULL,
  trade_vehicle_id INT NOT NULL,
  receive_vehicle_id INT,
  PRIMARY KEY (user_id, trade_vehicle_id),
  FOREIGN KEY (user_id) REFERENCES user_data(user_id),
  FOREIGN KEY (trade_vehicle_id) REFERENCES vehicles(vehicle_id)
);
