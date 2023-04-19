import { Antagonist, Category } from '../base';
import { multiline } from 'common/string';

const ContractKiller: Antagonist = {
  key: 'contractkiller',
  name: 'Contract Killer',
  description: [
    multiline`
    Plain and simple, you're here to kill someone. Gather intel, kill
    your target, and get home to get your pay.
    `,
  ],
  category: Category.Midround,
};

export default ContractKiller;
