import { Component } from '@angular/core';

@Component({
  selector: 'hello-angular',
  template: `<h1>Hello {{name}}</h1>`
})
export class FrontendComponent {
  name = 'Angular!';
}
