#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

=begin
#<
Install the Postgis binaries and create the template.

Note: this includes the postgresql::server after installing the postgis binaries.
#>
=end


if node['platform_family'] == 'debian'
  if node['platform'] == 'ubuntu' && node['platform_version'].to_f <= 12.04
    # Include the keys as cookbook files so that we don't need to go out
    # to retrieve keys from key server. This allows the recipe to execute
    # behind a firewall.
    include_recipe 'postgis::_add_keys'

    apt_repository 'ppa_ubuntugis_ubuntugis-stable' do
      uri 'http://ppa.launchpad.net/ubuntugis/ppa/ubuntu'
      distribution node['lsb']['codename']
      components ["main"]
      keyserver 'keyserver.ubuntu.com'
      key '314DF160'
      deb_src true
    end

    package 'python-software-properties'
  end
end

package node['postgis']['package']

include_recipe 'postgresql::server'

if node['postgis']['template_name']
  include_recipe 'postgis::_init_database_template'
end

