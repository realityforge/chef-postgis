# # encoding: utf-8

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe command('su - postgres -c \'psql --user postgres -d template_postgis -c "select PostGIS_Full_Version();"\'') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match (/POSTGIS=/) }
end
