// Run this example by adding <%= javascript_pack_tag 'top' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'

class Top extends React.Component{
    render() {
        return (
          <div>
              <h1>餃子の王将ガチャ</h1>
          </div>
        );
    }
}

document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(
        <Top />,
        document.getElementById('root'),
    )
})
