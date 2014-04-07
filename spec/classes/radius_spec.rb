require 'spec_helper'

describe 'radius', :type => :class do
  context 'on Debian' do
    let(:facts) { {
      :osfamily => 'Debian',
      :lsbdistid => 'debian',
      :lsbdistcodename => 'squeeze'
    }}

    context 'with no parameters' do
      it { should compile.with_all_deps }

      it { should contain_package('radius').with(
        :ensure => 'present',
        :name   => 'freeradius'
      )}

      it { should contain_service('radius').with(
        :ensure => 'running',
        :enable => true,
        :name   => 'freeradius'
      )}
    end
  end
end
