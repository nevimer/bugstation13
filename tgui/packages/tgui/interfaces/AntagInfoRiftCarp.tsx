import { useBackend } from '../backend';
import { Window } from '../layouts';
import { Section, Stack } from '../components';

type Info = {
  destination: string;
};

export const AntagInfoRiftCarp = (props, context) => {
  const { data } = useBackend<Info>(context);
  const { destination } = data;
  return (
    <Window width={400} height={380} theme="wizard">
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item textAlign="center" fontSize="20px">
            You are a Space Carp!
          </Stack.Item>
          <Stack.Item>
            <Section fill>
              <Stack vertical fill>
                <Stack.Item>
                  You have arrived in this strange place during your instinctual
                  migration back to the Space Carp Spawning Grounds.
                </Stack.Item>
                <Stack.Item>
                  The rift you arrived in will allow more of your kind passage,
                  it is the duty of every carp to ensure that it is not
                  destroyed so that more carp can continue their voyage, and
                  that they have a clear path to their destination.
                </Stack.Item>
                <Stack.Item>
                  You feel instinctually that you and your kin urgently need to
                  head to {destination}. Follow your siblings if you get lost,
                  they know the way.
                </Stack.Item>
                <Stack.Item>
                  Space Carp are somewhat intelligent animals and are sometimes
                  capable of rudimentary communication with humans, but remember
                  that your first priority is to defend this rift and your
                  second is that you have a very important mating appointment to
                  keep on the other side of the galaxy.
                </Stack.Item>
                <Stack.Item>
                  If these strange creatures built their nest in your path, that
                  is their problem.
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
