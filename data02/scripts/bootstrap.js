function m (x) {  if (typeof x === "undefined") x = 1; miner.start(); admin.sleepBlocks(x); miner.stop(); }
function bal (a) { if (typeof a === "undefined") a = me; var b = eth.getBalance(a); b = web3.fromWei(b); console.log(b); return b; }
var f = {}; function miningondemand () { f = eth.filter("pending");	f.watch(function() { miner.start(); }); eth.filter("latest", function(error, result) { if (eth.pendingTransactions.length) return; miner.stop(); }); }
function stopminingondemand () { f.stopWatching(); f = {}; }
