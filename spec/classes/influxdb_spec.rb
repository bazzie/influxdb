require 'spec_helper'

describe 'influxdb' do
   on_supported_os.each do |os, os_facts|
    describe "influxdb" do
      let(:facts) { os_facts }
      context "on #{os}" do
        let(:params) { { manage_repo: true } }

        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('influxdb::install').that_comes_before('Class[influxdb::config]') }
        it { is_expected.to contain_class('influxdb::config').that_requires('Class[influxdb::install]').that_notifies('Class[influxdb::service]') }
        it { is_expected.to contain_class('influxdb::service').that_requires('Class[influxdb::config]') }
      
      end
    end
  end
end