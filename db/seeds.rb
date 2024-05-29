# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'
car_park_csv_path = Rails.root.join('db','carpark_data.csv')
data_provider_csv_path = Rails.root.join('db', 'data_providers.csv')

CSV.foreach(data_provider_csv_path, headers: true) do |row|
  dp = DataProvider.find_or_initialize_by(
    id: row['id']
  )
  dp.name = row['name']
  dp.save
end

CSV.foreach(car_park_csv_path, headers: true) do |row|
  cp = CarPark.find_or_initialize_by(
      id: row['id']
  )
  cp.assign_attributes(
    name: (row['name']),
    address: (row['address']),
    address_postal: (row['address_postal']),
    zone: (row['zone']),
    longitude: (row['longitude']),
    latitude: (row['latitude']),
    x_coord: (row['x_coord']),
    y_coord: (row['y_coord']),
    start_time: (row['start_time']),
    end_time: (row['end_time']),
    remarks: (row['remarks']),
    capacity_car: (row['capacity_car']),
    capacity_mcycle: (row['capacity_mcycle']),
    capacity_heavy: (row['capacity_heavy']),
    is_active: (row['is_active']),
    height_limit: (row['height_limit']),
    height_advisory: (row['height_advisory']),
    special_advisory_info: (row['special_advisory_info']),
    payment_types: (row['payment_types']),
    carpark_types: (row['carpark_types']),
    location_point: (row['location_point']),
    rate_id_car: (row['rate_id_car']),
    rate_id_mcycle: (row['rate_id_mcycle']),
    rate_id_heavy: (row['rate_id_heavy']),
    grace_period: (row['grace_period']),
    car_park_operator_id: row['carpark_operator_id'] || rand(15),
    data_provider_id: row['data_provider_id'] || rand(3))
  cp.save
end
