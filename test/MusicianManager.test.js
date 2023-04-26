const MusicianManager = artifacts.require('./MusicianManager');

contract('MusicianManager', accounts => {
    it('Should add a musician', async () => {
        const contract = await MusicianManager.deployed();
        const result = await contract.addMusician('0x499e316e8c8dae95096d30b9fef3424c3bd8963c', 'Philou', {from: accounts[0]});
        assert.equal(result.logs[0].args._artistName, 'Philou', 'Not equal to Philou');
    })

    it('Should not a musician if it already exist', async () => {
        const contract = await MusicianManager.deployed();
        let err = null;
        try {
            await contract.addMusician('0x499e316e8c8dae95096d30b9fef3424c3bd8963c', 'Philoem', {from: accounts[0]})
        } catch (error) {
            err = error;
        }
        assert.ok(err instanceof Error);
    })

    it('Should add a track', async () => {
        const contract = await MusicianManager.deployed();
        const result = await contract.addTrack('0x499e316e8c8dae95096d30b9fef3424c3bd8963c', 'titleTrack', 180, {from: accounts[0]});
        assert.equal(result.logs[0].args._title, 'titleTrack', 'Not equal to title');
    })
})