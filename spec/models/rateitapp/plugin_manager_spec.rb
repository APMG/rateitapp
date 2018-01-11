# frozen_string_literal: true

require 'rails_helper'

module Rateitapp
  RSpec.describe PluginManager do
    let(:plugin_manager) { PluginManager.new }

    describe '#names' do
      subject { plugin_manager.names }

      it 'returns the correct names' do
        plugin1 = double('plugin1', name: 'ratable_1')
        plugin2 = double('plugin2', name: 'ratable_2')

        plugin_manager.add plugin1
        plugin_manager.add plugin2

        is_expected.to eq %w[ratable_1 ratable_2]
      end
    end

    describe '#add' do
      it 'successfully adds a new plugin' do
        expect(plugin_manager.names).to eq []
        plugin_manager.add double('plugin1', name: 'ratable_1')
        expect(plugin_manager.names).to eq %w[ratable_1]
      end
    end

    describe '#plugin_by_name' do
      context 'when the plugin exists' do
        it 'successfully returns the desired plugin' do
          plugin2 = double('plugin2', name: 'ratable_2')
          plugin_manager.add double('plugin1', name: 'ratable_1')
          plugin_manager.add plugin2

          expect(plugin_manager.plugin_by_name('ratable_2')).to eq plugin2
        end
      end

      context 'when the plugin does not exist' do
        it 'returns null object plugin' do
          plugin_manager.add double('plugin1', name: 'ratable_1')

          expect(plugin_manager.plugin_by_name('ratable_2')).to be_instance_of PluginManager::NullPlugin
        end
      end
    end

    describe '#valid?' do
      let(:ratable_type) { 'song' }
      let(:rating) { build(:song_rating, ratable_type: ratable_type) }
      let(:valid) { true }
      let(:plugin) { double('plugin1', name: 'song', valid?: valid) }

      before :each do
        plugin_manager.add plugin
      end

      subject { plugin_manager.valid?(rating) }

      context 'when the plugin exists and it is valid' do
        let(:valid) { true }
        let(:ratable_type) { 'song' }

        it { is_expected.to eq true }
        it 'has an empty errors array' do
          subject
          expect(rating.errors).to be_empty
        end
      end

      context 'when the plugin exists and it is not valid' do
        let(:valid) { false }
        let(:ratable_type) { 'song' }

        it { is_expected.to eq false }
      end

      context 'when the plugin does not exist' do
        let(:ratable_type) { 'not_a_song' }

        it { is_expected.to eq false }
      end
    end
  end
end
