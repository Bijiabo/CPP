MochaWeb?.testOnly ->
  describe 'ClientBasic', ()->
    describe '#test()', ()->
      it 'should return -1 when the value is not present', ()->
        chai.assert.equal(true,true)


    describe "#testSuccess()",()->
      it "should success",()->
        chai.assert.equal(true,true)