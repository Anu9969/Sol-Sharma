// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.4.16 < 0.9.0;

// 1. create a twitter contract
// 2. create a mapping between user and tweet
// 3. Add function to create a tweet and save it in mapping 
// 4. Create a function to get tweet


//Adding Struct
// 1.Define a tweet struct with author , content ,timestamp, likes
// 2. Add the struct to array
// 3. Test tweets

//Add a functiion called changeTweetlength to change max tweet length
// create a constructor function to set an owner of the contract
// create a modifier called onlyOwner
// use onlyOwner on the ChangeTweetLength function


contract Twitter{
    
    uint16 public Max_Tweet_Length = 200;

    //define our struct
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    // mapping(address => string) public tweets;
    //  mapping(address => string []) public tweets;//added array of strings for multiple tweets
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
        // tweets[msg.sender] = _tweet;
        // tweets[msg.sender].push(_tweet);

        //conditional
        //if tweet length <= 280 than we are good ,otherwise we revert

        require(bytes(_tweet).length <= 28, "The tweet is too long");
        
        Tweet memory newTweet = Tweet({
            author:msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

    }

    // function getTweets(address _owner) public view returns (string memory){
    //     return tweets[_owner];
    // }
    //  function getTweets(address _owner , uint _i) public view returns (string memory){
    //     return tweets[_owner][_i];//added the index of tweet from array
    // }

    function getTweets(address _owner ,uint _i) public view returns(Tweet memory){
        return tweets[_owner][_i]; // replaced string eturn to struct 
    }

    // function getAllTweets(address _owner ) public view returns(string[] memory){
    //     return tweets[_owner];
    // }

    function getAllTweets(address _owner ) public view returns (Tweet[] memory){
        return tweets[_owner];
    }
}