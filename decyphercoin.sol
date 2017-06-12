contract DecypherCoin {
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => unint256)) public allowances;
    uint256 public totalSupply;

    string public name;
    uint8 public decimals;
    string public symbol;
    string public version;

    address public centralMinter;

    uint256 public buyPrice;
    uint256 public sellPrice;

    modifier onlyMinter {
        if(msg.sender != centralMinter) throw;
        _;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    function DecypherCoin(uint256 _initialAmount) {
       return balances[msg.sender] = _initialAmount;
       totalSupply = _initialAmount;
       name = "DecypherCoin;
       decimals = 18;
       symbol = "DCY";
       version = "0.1";

    }

    function balanceOf(address _address) constant returns (uint256 balance){
        return balances[_address];

    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining){
         return allowances[_owner][_spender];
    }

    function transfer(address _to, uint256 _value) returns (bool success){
        if(balances[msg.sender] < _value) throw;
        if(balances[_to] + _value < balances[_to]) throw;
          balances[msg.sender] -= _value;
          balances[_to] += _value;
          Transfer(msg.sender, _to, _value);
          return true;
    }

    function approve(address _spender, uint256 _value) returns (bool success){
        allowances.[msg.sender][_spender] = _value;
        Approval(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _spender, address _to, uint256 _value) returns (uint256 remaining){
        if(balances[_owner] <_value) throw;
        if(balances[_to] + _value < balances[_to]) throw;
        if(allowances[_owner][msg.sender] < _value) throw;
         balances[_owner] -= _value;
         balances[_to] += _value;
         allowances[_owner][msg.sender] -= _value;
         Transfer(_owner, _to, _value);
         return true;
    }

    function mint(uint256 _amountToMint) onlyMinter{
        balances[centralMinter] += _amountToMint;
        totalSupply += _amountToMint;
        Transfer(this, centralMinter, _amountOtMint);
    }

    function transferMinter(address _newMinter) onlyMinter {
        centralMinter = _newMinter;

    }
}