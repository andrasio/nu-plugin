require 'nu_plugin/command'

describe NuPlugin::Command do
  context 'configuration' do
    it 'can have a name' do
      class NameTest < NuPlugin::Command
        name 'test_command'
      end

      expect(NameTest.new.configuration[:name]).to eql('test_command')
    end

    it 'can have named flag' do
      class FlagTest < NuPlugin::Command
        flag 'load'
      end

      expect(FlagTest.new.configuration[:named][0]).to eql('load')
    end

    context 'filter command' do
      it "infers it's a filter by the presence of filter!" do
        class FilterTypeTest < NuPlugin::Command
          def filter(params); end
        end

        expect(FilterTypeTest.new.configuration[:is_filter]).to be(true)
      end

      it 'can set before action' do
        class BeforeFilterTest < NuPlugin::Command
          before_action :ping

          def ping
            'pong'
          end
        end

        action = BeforeFilterTest.instance_variable_get('@before')
        expect(BeforeFilterTest.new.send(action)).to eql('pong')
      end

      it 'can set after action' do
        class AfterFilterTest < NuPlugin::Command
          after_action :ping

          def ping
            'pong'
          end
        end

        action = AfterFilterTest.instance_variable_get('@after')
        expect(AfterFilterTest.new.send(action)).to eql('pong')
      end
    end

    context 'sink command' do
      it "infers it's a sink by the presence of sink!" do
        class SinkTypeTest < NuPlugin::Command
          def sink(params); end
        end

        expect(SinkTypeTest.new.configuration[:is_filter]).to be(false)
      end
    end
  end
end