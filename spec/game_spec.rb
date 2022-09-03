# frozen_string_literal: true
require_relative '../lib/game'

describe Game do
  describe '#create_board' do
    context 'create an X-Y sized grid' do
      subject(:board_test) { described_class.new }

      xit 'creates a 7x6 grid' do
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

  describe '#vertical_sequence?' do
    context 'check if a player has formed a 4 in a row pieces vertically' do
      subject(:vertical_test) { described_class.new }

      it '4 in a row - Vertically' do
        # Assign
        vertical_test.instance_variable_get(:@board)[0][1] = 'y'
        vertical_test.instance_variable_get(:@board)[0][2] = 'y'
        vertical_test.instance_variable_get(:@board)[0][3] = 'y'
        vertical_test.instance_variable_get(:@board)[0][4] = 'y'
        # Act
        status = vertical_test.vertical_sequence?
        # Assert
        expect(status).to be true
      end

      it '4 in a row - Vertically - Different Positions' do
        # Assign
        vertical_test.instance_variable_get(:@board)[0][6] = 'y'
        vertical_test.instance_variable_get(:@board)[0][3] = 'y'
        vertical_test.instance_variable_get(:@board)[0][5] = 'y'
        vertical_test.instance_variable_get(:@board)[0][4] = 'y'
        # Act
        status = vertical_test.vertical_sequence?
        # Assert
        expect(status).to be true
      end

      it 'no 4 in a row' do
        # Assign
        vertical_test.instance_variable_get(:@board)[0][6] = 'y'
        vertical_test.instance_variable_get(:@board)[0][3] = 'l'
        vertical_test.instance_variable_get(:@board)[0][5] = 'y'
        vertical_test.instance_variable_get(:@board)[0][4] = 'l'
        # Act
        status = vertical_test.vertical_sequence?
        # Assert
        expect(status).to be false
      end

    end
  end

  describe '#horizontal_sequence?' do
    context 'check if a player has formed a 4 in a row pieces horizontally' do
      subject(:horizontal_test) { described_class.new }

      it '4 in a row - Horizontally' do
        # Assign
        horizontal_test.instance_variable_get(:@board)[1][0] = 'y'
        horizontal_test.instance_variable_get(:@board)[2][0] = 'y'
        horizontal_test.instance_variable_get(:@board)[3][0] = 'y'
        horizontal_test.instance_variable_get(:@board)[4][0] = 'y'
        # Act
        status = horizontal_test.horizontal_sequence?
        # Assert
        expect(status).to be true
      end

      it '4 in a row - Horizontally - But not the initial column' do
        # Assign
        horizontal_test.instance_variable_get(:@board)[5][3] = 'y'
        horizontal_test.instance_variable_get(:@board)[4][3] = 'y'
        horizontal_test.instance_variable_get(:@board)[2][3] = 'y'
        horizontal_test.instance_variable_get(:@board)[3][3] = 'y'
        # Act
        status = horizontal_test.horizontal_sequence?
        # Assert
        expect(status).to be true
      end
      
      it 'no 4 in a row' do
        # Assign
        horizontal_test.instance_variable_get(:@board)[5][0] = 'y'
        horizontal_test.instance_variable_get(:@board)[2][0] = 'y'
        horizontal_test.instance_variable_get(:@board)[1][0] = 'y'
        horizontal_test.instance_variable_get(:@board)[4][0] = 'y'
        # Act
        status = horizontal_test.horizontal_sequence?
        # Assert
        expect(status).to be false
      end
    end
  end

  describe '#diagonal_sequence?' do
    context 'check if a player has formed a 4 in a row pieces diagonally' do
      subject(:diagonal_test) { described_class.new }

      it 'no 4 in a row' do
        # Assign
        # Act
        status = diagonal_test.diagonal_sequence?
        # Assert
        expect(status).to be false
      end

      it '4 in a row - Diagonally - Forward Direction ' do
        # Assign
        diagonal_test.instance_variable_get(:@board)[0][0] = 'y'
        diagonal_test.instance_variable_get(:@board)[1][1] = 'y'
        diagonal_test.instance_variable_get(:@board)[2][2] = 'y'
        diagonal_test.instance_variable_get(:@board)[3][3] = 'y'
        # Act
        status = diagonal_test.diagonal_sequence?
        # Assert
        expect(status).to be true
      end

      it '4 in a row - Diagonally - Reverse Direction ' do
        # Assign
        diagonal_test.instance_variable_get(:@board)[2][3] = 'y'
        diagonal_test.instance_variable_get(:@board)[3][2] = 'y'
        diagonal_test.instance_variable_get(:@board)[4][1] = 'y'
        diagonal_test.instance_variable_get(:@board)[5][0] = 'y'
        # Act
        status = diagonal_test.diagonal_sequence?
        # Assert
        expect(status).to be true
      end
    end
  end

  describe '#verify_input' do
    subject(:input_check) { described_class.new }

    context 'Valid input as an argument' do
      it 'returns the valid input' do
        user_selection = '5'
        verify = input_check.verify_input(user_selection.to_i)
        expect(verify).to eq(5)
      end
    end
    context 'Invalid input as an argument' do
      it 'returns nil' do
        user_selection = '8'
        verify = input_check.verify_input(user_selection.to_i)
        expect(verify).to be nil 
      end
    end
  end

  describe '#selection' do
    subject(:selection_test) { described_class.new }
    context 'when the user input is valid' do
      it 'stops loop and stores selection' do
        valid_input = 3
        allow(selection_test).to receive(:player_selection).and_return(valid_input)
        expect(selection_test).not_to receive(:puts).with('You can only choose a number between 1 and 7')
        selection_test.selection

      end
    end

    context 'when the user input is invalid once, then it is valid in the second try' do
      before do
        invalid_input = 'xd'
        valid_input = 3
        allow(selection_test).to receive(:player_selection).and_return(invalid_input, valid_input)
      end
      it 'completes loop and stores user selection' do
        expect(selection_test).to receive(:puts).with('You can only choose a number between 1 and 7').once
        selection_test.selection
      end
    end
  end

  describe '#set_piece' do
    subject(:set_check) { described_class.new }
    context 'when the user selects a column to play in, place it accordingly' do

      it 'places at the start of the 3rd column because there is no other pieces at the first row' do
        user_symbol = 'p1'
        user_column = 2
        allow(set_check).to receive(:selection).and_return(user_column)
        set_check.set_piece
        position = set_check.instance_variable_get(:@board)[0][user_column - 1]
        expect(position).to eq(user_symbol)
      end
    end
  end
end
