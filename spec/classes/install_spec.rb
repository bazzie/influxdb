require 'spec_helper'

describe 'influxdb::install' do
  let(:hiera_config) { 'hiera.yaml' }

  hiera = Hiera.new( { :config => 'hiera.yaml' } )
  manage_repo = hiera.lookup('manage_repo', nil, nil)

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      it { is_expected.to compile }

      let (:hiera_data) { { :manage_repo => manage_repo } }

    end
  end
end
