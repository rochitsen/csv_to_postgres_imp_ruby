#imports a csv to postgres table
#define the table structure and csv structure in the script

require "sequel"
require "faker"
require "progressbar"
require "simple_importer"
require "csv"
require "rgeo"

#opening a postgres connection
#DB=Sequel.connect(:adapter=>'oracle', :host=>'192.168.172.204', :database=>'STIMIGRATION', :user=>'sti', :password=>'sti')

DB = Sequel.connect('postgres://localhost/ai_epsm_v4?user=postgres&password=postgres')
DB.create_table :conductor_er do
	
	String :obj_id
	String :id
	String :class_id
	String :type_id
	String :status_id
	String :functional_location
	String :terminal_a
	String :terminal_b
	String :manufacturer
	String :model
	String :manufactured_date
	String :inservice_date
	String :alias
	String :price
	String :rated_life
	String :asset_redundancy
	String :asset_function
	String :asset_class_failure_rate
	String :restoration_duration
	String :environment
	String :safety
	String :date_created
	String :date_modified
	String :feeder_id
	String :station_id
	String :region_id
	String :res_is_updated
	String :geometry1
	String :v_nom
	String :length
	String :geometry
end

#Object to insert the values in db
items=DB[:conductor_er]

#faster csv
 CSV.foreach("./conductor_wkt.csv", headers:true) do |row|
    # use row here...
	
	#for i in 0..row.length
	#puts row[i].to_s
items.insert(:obj_id => row['OBJ_ID'], 
			:id => row['ID'],
			:class_id => row['CLASS_ID'],
			:type_id => row['TYPE_ID'],
			:status_id => row['STATUS_ID'],
			:functional_location => row['FUNCTIONAL_LOCATION'],
			:terminal_a => row['TERMINAL_A'],
			:terminal_b => row['TERMINAL_B'],
			:manufacturer => row['MANUFACTURER'],
			:model => row['MODEL'],
			:manufactured_date => row['MANUFACTURED_DATE'],
			:inservice_date => row['INSERVICE_DATE'],
			:alias => row['ALIAS'],
			:price => row['PRICE'],
			:rated_life => row['RATED_LIFE'],
			:asset_redundancy => row['ASSET_REDUNDANCY'],
			:asset_function => row['ASSET_FUNCTION'],
			:asset_class_failure_rate => row['ASSET_CLASS_FAILURE_RATE'],
			:restoration_duration => row['RESTORATION_DURATION'],
			:environment => row['ENVIRONMENT'],
			:safety => row['SAFETY'],
			:date_created => row['DATE_CREATED'],
			:date_modified => row['DATE_MODIFIED'],
			:feeder_id => row['FEEDER_ID'],
			:station_id => row['STATION_ID'],
			:region_id => row['REGION_ID'],
			:res_is_updated => row['RES_IS_UPDATED'],
			:geometry1 => row['GEOMETRY1'],
			:v_nom => row['V_NOM'],
			:length => row['LENGTH'],
			:geometry => row['GEOMETRY'])
 end


