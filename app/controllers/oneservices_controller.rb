##
## Copyright [2013-2015] [Megam Systems]
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
## http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##
class OneservicesController < NilavuController
  include OnexyzHelper
  respond_to :html, :js
  before_action :stick_keys, only: [:index]

  def show
  end

  def index
    @assembly = Api::Assembly.new.show(params.merge({"id" => params[:id]})).by_cattypes[Api::Assemblies::SERVICE]
    @bound_apps = bound_assemblies(Api::Assemblies.new.list(params).assemblies_grouped[Api::Assemblies::APP], @assembly.components[0][0].components.related_components)
  end
end
