class CreateCarparks < ActiveRecord::Migration[7.1]
  def up
    enable_extension :postgis
    enable_extension :postgis_topology
    enable_extension 'pg_trgm'
    execute "CREATE TABLE public.car_parks
    (
      id integer,
      cp_code character varying,
      name character varying NOT NULL,
      address character varying,
      address_postal character varying,
      zone character varying,
      longitude numeric,
      latitude numeric,
      x_coord numeric,
      y_coord numeric,
      rates character varying,
      start_time character varying NOT NULL,
      end_time character varying NOT NULL,
      data_provider_id integer,
      remarks character varying,
      capacity_car integer,
      capacity_mcycle integer,
      capacity_heavy integer,
      is_active boolean NOT NULL DEFAULT true,
      height_limit numeric,
      height_advisory character varying,
      special_advisory_info character varying,
      car_park_operator_id integer,
      payment_types character varying,
      carpark_types character varying,
      location_point geometry(Point,4326),
      rate_id_car character varying,
      rate_id_mcycle character varying,
      rate_id_heavy character varying,
      grace_period character varying,
      version character varying,
      created_at timestamp without time zone NOT NULL,
      updated_at timestamp without time zone NOT NULL
    )
    WITH (
      OIDS=FALSE
    );"
    execute "ALTER TABLE car_parks ADD PRIMARY KEY(id);"

    add_index :car_parks, :cp_code
    add_index :car_parks, :carpark_types
    add_index :car_parks, :location_point

    # add_reference :car_parks, :car_park_operator
    # add_reference :car_parks, :data_provider
  end

  def down
    drop_table :car_parks
  end
end
