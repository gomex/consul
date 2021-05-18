import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';

export default class CollapsibleNotices extends Component {
  // =attributes
  @tracked hide = false;

  // =methods
  hideNoticesDetails(items) {
    items.forEach(item => {
      item.classList.add('hide');
    });
  }

  showNoticesDetails(items) {
    items.forEach(item => {
      item.classList.remove('hide');
    });
  }

  // =actions
  @action
  toggle() {
    this.hide = !this.hide;

    const baseElement = document.querySelector('.collapsible-notices');
    const noticeDetails = baseElement.querySelectorAll('p');

    if (this.hide) {
      this.hideNoticesDetails(noticeDetails);
    } else {
      this.showNoticesDetails(noticeDetails);
    }
  }
}
