# -*- encoding: utf-8 -*-
#
# Author:: Nathan Brewer (<nathan.brewer@rightscale.com>)
#
# Copyright (C) 2015, Nathan Brewer
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'kitchen'
require 'right_api_client'

module Kitchen

  module Driver

    # Rightscale driver for Kitchen.
    #
    # @author Nathan Brewer <nathan.brewer@rightscale.com>
    class Rightscale < Kitchen::Driver::Base

      kitchen_driver_api_version 2
      plugin_version Kitchen::Driver::RIGHTSCALE_VERSION
      
      default_config :email, nil
      default_config :password, nil
      required_config :account_id, nil
      default_config :refresh_token, nil
      required_config :api_url, nil
      default_config :template, nil
      default_config :deployment, nil
      default_config :server_name, nil
           
      def create(state)
        @Client = RightApi::Client.new(:email => driver[:email], :password => driver[:password], :account_id => driver[:account_id])
        @server = @Client.servers.index(:filter => ['#{driver[:server_name}'])
        @server.launch()
      end

      def destroy(state)
        @Client = RightApi::Client.new(:email => driver[:email], :password => driver[:password], :account_id => driver[:account_id])
        @server = @Client.servers.index(:filter=> ['#{driver[:server_name}'])
        @server.terminate()
      end
    end
  end
end
