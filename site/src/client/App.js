import React from 'react';

class App extends React.Component{
  constructor(props){
    super(props);
    this.state = {
      search: 'Am I the only one seeing this'
    };
  }

  setSearch = (e) =>{
    this.setState({search: e.target.value});
  }

  render(){
    return (
      <div>
        <input type ="text" value={this.state.search} onChange={this.setSearch} />
      </div>
    );
  }
}

export default App;
