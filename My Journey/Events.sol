// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.4.16 < 0.9.0;




contract Twitter{
    
    uint16 public Max_Tweet_Length = 200;

    //define our struct
    struct Tweet{
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

  
    mapping(address => Tweet[]) public tweets; //replaced string array with tweet struct
    address public owner;
 
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner , "You are not the owner" );
        _;
    }

    function changeTweetLength(uint16 newTweetlength) public onlyOwner{
    Max_Tweet_Length = newTweetlength;
}

    function createTweet(string memory _tweet) public {
  
        //conditional
        //if tweet length <= 280 than we are good ,otherwise we revert

        require(bytes(_tweet).length <= 28, "The tweet is too long");
        
        Tweet memory newTweet = Tweet({
            id: Max_Tweet_Length ,
            author:msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

    }

    function likeTweet(address author , uint256 id) external {
        //if tweet does not exist
        require(tweets[author][id].id == id , "Tweet does not exist");
        tweets[author][id].likes++ ;

    }

    function unlikeTweet(address author , uint256 id) external {
        require(tweets[author][id].id == id, "Tweet does not exist");
        require(tweets[author][id].likes != 0, "Tweet does not have any likes");
        
        tweets[author][id].likes--;
    }


    function getTweets(address _owner ,uint _i) public view returns(Tweet memory){
        return tweets[_owner][_i]; // replaced string eturn to struct 
    }



    function getAllTweets(address _owner ) public view returns (Tweet[] memory){
        return tweets[_owner];
    }
}