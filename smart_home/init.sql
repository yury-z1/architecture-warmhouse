CREATE SCHEMA IF NOT EXISTS smart_home;

CREATE TABLE IF NOT EXISTS smart_home.sensor (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  location TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS smart_home.reading (
  id BIGSERIAL PRIMARY KEY,
  sensor_id UUID NOT NULL REFERENCES smart_home.sensor(id),
  ts TIMESTAMP NOT NULL DEFAULT now(),
  value NUMERIC NOT NULL,
  unit TEXT NOT NULL DEFAULT 'C'
);

-- Пример данных
INSERT INTO smart_home.sensor (name, location)
VALUES ('temp-virtual-1', 'living-room')
ON CONFLICT DO NOTHING;
