# frozen_string_literal: true
require_relative '../lib/game'

describe Game do
  describe '#create_board' do
    context 'create an X-Y sized grid' do
      subject(:board_test) { described_class.new }

      it 'creates a 7x6 grid' do
        # assign
        test = board_test.instance_variable_get(:@board)
        x_axis = 7
        y_axis = 6
        # act
        board = board_test.create_board(x_axis, y_axis)
        # assert
        expect(board).to eql(test)
      end
    end
  end

  describe '#position_empty?' do
    context 'check if the position is empty' do
      subject(:position_test) { described_class.new }
      it 'position is empty' do
        # Assign
        x_axis = 0
        y_axis = 0
        # Act
        status = position_test.position_empty?(x_axis, y_axis)
        # Assert
        expect(status).to be true
      end
      it 'position is filled' do
        # Assign
        x_axis = 0
        y_axis = 0
        position_test.instance_variable_get(:@board)[x_axis][y_axis] = 'x'
        # Act
        status = position_test.position_empty?(x_axis, y_axis)
        # Assert
        expect(status).to be false
      end
    end
  end
end
