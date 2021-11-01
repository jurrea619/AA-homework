require 'rspec'
require 'arr_projects'

describe '#my_uniq' do
    let(:arr) { [1, 2, 1, 4, 3, 3, 6] }
    let(:uniq_arr) { [1,2,4,3,6] }

    it 'does not change original array' do
        expect { my_uniq(arr) }.to_not change{arr}
    end

    it 'has only one of each unique element in new array' do
        arr.each do |el|
            expect(uniq_arr.count(el)).to eq(1)
        end
    end

    it 'returns elements in order which they appeared' do
        expect(my_uniq(arr)).to eq(uniq_arr)
    end        
end

describe '#two_sum' do
    let(:arr) { [-1, 0, 2, -2, 1] }
    let(:zero_arr) { [-1, 0, 3, 0] }

    it 'finds pairs that sum to 0' do
        expect(two_sum(arr)).to eq([[0,4], [2,3]])
    end

    it 'handles zeroes properly' do
        expect(two_sum(zero_arr)).to eq([[1,3]])
    end
end

describe '#my_transpose' do
    let(:arr) { [ [0,1,2], [3,4,5], [6,7,8] ]}
    let(:transposed) {[ [0,3,6], [1,4,7], [2,5,8] ]}

    it 'correctly transposes matrix' do
        expect(my_transpose(arr)).to eq(transposed)
    end
end

describe '#stock_picker' do
    let(:simple_pair) { [3,2,5,7] }
    let(:crash) { [5,4,3,2,1] }

    it 'returns pair of days' do 
        expect(stock_picker(simple_pair)).to eq([1,3])
    end

    it 'does not buy in a crash' do
        expect(stock_picker(crash)).to be_nil
    end
end

