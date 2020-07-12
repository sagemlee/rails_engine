desc 'Data Importing'
task :data_import do
  rails db:seed 
  rails db:seed
end