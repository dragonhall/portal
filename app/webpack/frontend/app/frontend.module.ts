import { BrowserModule } from '@angular/platform-browser'
import { NgModule } from '@angular/core'
import { HttpClientModule } from '@angular/common/http'


import { FrontendComponent } from './frontend.component'

@NgModule({
  declarations: [FrontendComponent],
  imports: [BrowserModule, HttpClientModule],
  providers: [],
  bootstrap: [FrontendComponent],
})
export class FrontendModule {}
