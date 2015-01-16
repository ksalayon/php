require 'spec_helper'

describe 'php_runtime_test::default' do
  cached(:centos_58_runtime_51) do
    ChefSpec::SoloRunner.new(
      platform: 'centos',
      version: '5.8',
      # step_into: 'php_runtime'
      ) do |node|
      node.set['php']['version'] = '5.1'
    end.converge('php_runtime_test::default')
  end

  context 'compiling the test recipe' do
    it 'creates php_runtime[default]' do
      expect(centos_58_runtime_51).to install_php_runtime('default')
        .with(version: '5.1')
    end
  end
end
